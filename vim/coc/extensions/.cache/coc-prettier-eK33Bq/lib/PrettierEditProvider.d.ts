import { DocumentFormattingEditProvider, DocumentRangeFormattingEditProvider } from 'coc.nvim/lib/provider';
import { CancellationToken, FormattingOptions, Range, TextDocument, TextEdit } from 'vscode-languageserver-protocol';
import { PrettierConfig } from './types.d';
/**
 * Format the given text with user's configuration.
 * @param text Text to format
 * @param path formatting file's path
 * @returns {string} formatted text
 */
export declare function format(text: string, { languageId, uri }: TextDocument, customOptions: Partial<PrettierConfig>): Promise<string>;
export declare function fullDocumentRange(document: TextDocument): Range;
declare class PrettierEditProvider implements DocumentRangeFormattingEditProvider, DocumentFormattingEditProvider {
    private _fileIsIgnored;
    constructor(_fileIsIgnored: (filePath: string) => boolean);
    provideDocumentRangeFormattingEdits(document: TextDocument, range: Range, _options: FormattingOptions, _token: CancellationToken): Promise<TextEdit[]>;
    provideDocumentFormattingEdits(document: TextDocument, _options: FormattingOptions, _token: CancellationToken): Promise<TextEdit[]>;
    private _provideEdits;
}
export default PrettierEditProvider;